import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../core/widgets/screen_header.dart';
import '../../../core/theme/appcolors.dart';
import 'tariff_confirmation_screen.dart';

class SmsConfirmationScreen extends StatefulWidget {
  final String newTariff;
  final String effectiveDate;

  const SmsConfirmationScreen({
    super.key,
    required this.newTariff,
    required this.effectiveDate,
  });

  static const String _phoneNumber = '+7(952) ***-**-91';

  @override
  State<SmsConfirmationScreen> createState() => _SmsConfirmationScreenState();
}

class _SmsConfirmationScreenState extends State<SmsConfirmationScreen> 
    with TickerProviderStateMixin {
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isLoading = false;
  bool _isFocused = false;
  int _resendTimer = 300; // 5 минут в секундах
  bool _canResend = false;
  
  late AnimationController _animationController;
  late List<Animation<double>> _dotAnimations;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    
    // Инициализация анимаций для лоадера
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _dotAnimations = List.generate(3, (index) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.2, // Задержка для каждой точки
            (index + 1) * 0.2,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });
    
    // Автофокус на поле ввода
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    
    // Добавляем слушатели фокуса
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _startResendTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          if (_resendTimer > 0) {
            _resendTimer--;
            _startResendTimer();
          } else {
            _canResend = true;
          }
        });
      }
    });
  }

  void _resendCode() {
    if (_canResend) {
      setState(() {
        _resendTimer = 300;
        _canResend = false;
      });
      _startResendTimer();
      // Здесь можно добавить логику отправки SMS
    }
  }

  void _submitCode() {
    final code = _codeController.text.trim();
    if (code.length == 6) {
      setState(() {
        _isLoading = true;
      });
      
      // Запускаем анимацию лоадера
      _animationController.repeat();

      // Имитация загрузки 2 секунды
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          _animationController.stop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => TariffConfirmationScreen(
                newTariff: widget.newTariff,
                effectiveDate: widget.effectiveDate,
              ),
            ),
          );
        }
      });
    }
  }

  String _formatResendTime() {
    final minutes = _resendTimer ~/ 60;
    final seconds = _resendTimer % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _buildLoaderDot(int index) {
    return AnimatedBuilder(
      animation: _dotAnimations[index],
      builder: (context, child) {
        return Transform.scale(
          scale: 0.5 + (_dotAnimations[index].value * 0.5),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.textBaseSecondary,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBaseTertiary,
      body: Column(
        children: [
          // Шапка экрана
          ScreenHeader(title: 'Подтверждение'),
          
          // Основной контент (отцентрирован)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Инструкционный текст
                  Text(
                    'Код смс-подписи будет отправлен на ваш\nномер ${SmsConfirmationScreen._phoneNumber}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBaseDefault,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Поле ввода SMS кода или Loader
                  if (!_isLoading)
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _isFocused ? AppColors.inputBorderShadeActive : Colors.transparent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.inputBorderActive,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.inputBgActive,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Группа: Label + поле ввода
                              Column(
                                children: [
                                  // Label сверху
                                  Text(
                                    'Код из SMS',
                                    style: TextStyle(
                                      color: AppColors.inputLabelActive,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  // Поле ввода
                                  SizedBox(
                                    height: 24,
                                    child: TextField(
                                      controller: _codeController,
                                      focusNode: _focusNode,
                                      keyboardType: TextInputType.number,
                                      maxLength: 6,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.inputTextDefault,
                                        height: 1.0,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '', // Пустой placeholder
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 0,
                                        ),
                                        counterText: '',
                                      ),
                                      onChanged: (value) {
                                        if (value.length == 6) {
                                          _submitCode();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    // Loader вместо всего инпута (без лейбла)
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        height: 56,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildLoaderDot(0),
                              const SizedBox(width: 8),
                              _buildLoaderDot(1),
                              const SizedBox(width: 8),
                              _buildLoaderDot(2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  
                  const SizedBox(height: 16),
                  
                  // Таймер повторной отправки
                  GestureDetector(
                    onTap: _canResend ? _resendCode : null,
                    child: Text(
                      _canResend 
                        ? 'Отправить код повторно'
                        : 'Отправить код ещё раз через ${_formatResendTime()}',
                      style: TextStyle(
                        fontSize: _canResend ? 14 : 12,
                        fontWeight: _canResend ? FontWeight.w500 : FontWeight.w400,
                        color: _canResend 
                          ? AppColors.buttonLabelText 
                          : AppColors.textBaseSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
 }
