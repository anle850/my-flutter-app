part of 'example_cubit.dart';

@immutable
sealed class ExampleState extends Equatable {
  final int count;

  const ExampleState({required this.count});


  @override
  List<Object> get props => [count];
}

final class ExampleCopyWith extends ExampleState{
  const ExampleCopyWith({required super.count});
}

// final class ExampleInitial extends ExampleState {
//   const ExampleInitial() : super(count: 0);
// }
//
// final class ExampleLoading extends ExampleState {
//   const ExampleLoading({required super.count});
// }
//
// final class ExampleLoaded extends ExampleState {
//   const ExampleLoaded({required super.count});
// }
//
// final class ExampleError extends ExampleState {
//   final String message;
//
//   const ExampleError({required super.count, required this.message});
//
//   @override
//   List<Object> get props => [count, message];
// }
