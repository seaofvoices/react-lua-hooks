type SetStateValue<T> = (T) -> ()
type UpdateStateValue<T> = ((T) -> T) -> ()

export type SetState<T> = SetStateValue<T> & UpdateStateValue<T>

return nil
