/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/18 23:54:44 by nistanoj          #+#    #+#             */
/*   Updated: 2025/03/27 21:46:55 by nistanoj         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*nlst;
	t_list	*elem;
	void	*ncont;

	nlst = NULL;
	while (lst)
	{
		ncont = f(lst->content);
		if (!ncont)
		{
			ft_lstclear(&nlst, del);
			return (NULL);
		}
		elem = ft_lstnew(ncont);
		if (!elem)
		{
			ft_lstclear(&nlst, del);
			del(ncont);
			return (NULL);
		}
		ft_lstadd_back(&nlst, elem);
		lst = lst->next;
	}
	return (nlst);
}
